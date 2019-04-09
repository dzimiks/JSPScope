package beans;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class Scopes {

    private Map<String, String> scopes;

    public Scopes() {
        this.scopes = new HashMap<>();
    }

    public Set<String> getKeys() {
        return this.scopes.keySet();
    }

    public String get(String key) {
        return this.scopes.get(key);
    }

    public void put(String key, String value) {
        this.scopes.put(key, value);
    }

    public boolean isEmpty() {
        return this.scopes.isEmpty();
    }
}
