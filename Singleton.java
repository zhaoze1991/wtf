class Test {
    private int age;

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    private static Test obj = null;

    private Test(int age) {
        this.age = age;
    }

    // only static method can be called by class name
    public static Test create(int age) {
        if (obj == null) {
            obj = new Test(age);
        }
        return obj;
    }
};

public class Singleton {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        Test t = Test.create(10);
        System.out.println(t.getAge());
    }

}
