package event_processor_advanced;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.atomic.AtomicLong;

import org.apache.kafka.streams.kstream.ForeachAction;
import org.apache.kafka.streams.kstream.Windowed;

public class MyProcessor implements ForeachAction<Windowed<String>, CountAndSum> {

    private static final DateTimeFormatter TS =
            DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss")
                    .withZone(ZoneId.systemDefault());

    // Track last printed window (start+end) so we can insert a header when it changes
    private static final AtomicLong LAST_WINDOW_START = new AtomicLong(-1L);
    private static final AtomicLong LAST_WINDOW_END   = new AtomicLong(-1L);

    @Override
    public void apply(Windowed<String> windowedKey, CountAndSum agg) {
        long ws = windowedKey.window().start();
        long we = windowedKey.window().end();

        // If this is a new window, print a separator + header
        if (ws != LAST_WINDOW_START.get() || we != LAST_WINDOW_END.get()) {
            LAST_WINDOW_START.set(ws);
            LAST_WINDOW_END.set(we);

            String start = TS.format(Instant.ofEpochMilli(ws));
            String end   = TS.format(Instant.ofEpochMilli(we));

            System.out.printf(
                    "%n--------------------  Window [%s - %s]  --------------------%n",
                    start, end
            );
        }

        // Print the aggregate for this key inside the window block
        System.out.printf(
                "Product: %-15s | Total sold: %-4.0f | Transactions: %d%n",
                windowedKey.key(), agg.sum, agg.count
        );
    }
}
