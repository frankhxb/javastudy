
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;

public class HelloLoader extends ClassLoader {
    public static void main(String[] args) throws Exception {
        String className = "Hello";
        String methodName = "hello";

        ClassLoader classLoader = new HelloLoader();
        Class<?> classHello = classLoader.loadClass(className);

        System.out.println("----------list all hello method ------------");
        for (Method m : classHello.getDeclaredMethods()) {
            System.out.println(classHello.getSimpleName() + "." + m.getName());
        }

        Object instance = classHello.getDeclaredConstructor().newInstance();
        Method method = classHello.getMethod(methodName);

        System.out.println("----------call Hollo.hell()------------");
        method.invoke(instance);
    }

    @Override
    protected Class<?> findClass(String name) throws ClassNotFoundException {

        InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream(name + ".xlass");
        try {

            int length = inputStream.available();
            byte[] classBytes = new byte[length];
            inputStream.read(classBytes);

            for (int i = 0; i < classBytes.length; i++) {
                classBytes[i] = (byte)(255 - classBytes[i]);
            }

            return defineClass(name, classBytes, 0, classBytes.length);
        } catch (IOException e) {
            throw new ClassNotFoundException(name, e);
        } finally {
            close(inputStream);
        }
    }

    private static void close(Closeable res) {
        if (null != res) {
            try {
                res.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
