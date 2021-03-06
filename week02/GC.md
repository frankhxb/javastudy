串行GC
1. 单线程回收垃圾，执行效率低
2. CPU利用率最高，停顿时间即用户等待时间比较长。
3. 适用场景：小型应用

并行GC
1. Jdk8默认GC，多线程执行，执行效率比串行GC高。
2. 默认经过15次Young GC没有被回收的对象，会被晋升到Old 区，开启自适应参数则不一定。
3. 堆内存变大后，GC暂停时间会变长
4. 特点：停顿时间短，回收效率高，对吞吐量要求高。
5. 适用场景：大型应用，科学计算，大规模数据采集等。

CMS GC
1. CMS GC分为六个阶段，初始化标记、并发标记、并发预处理、最终标记、并发清除、并发重置
2. 先做多线程串行Young GC，然后做CMS Old GC，然后并发标记，并发预清理，CMS过程中有可能会发生Young GC
3. 上面步骤完成后进行CMS最终标记，这时候才业务暂停，其它时候不会业务暂停
4. 之后做并发清理，并发重置，CMS GC完成
5. 特点：响应时间优先，减少垃圾收集停顿时间
6. 适应场景：服务器、电信领域等

G1GC
1. G1 GC是CMS GC改进算法，在G1中，堆被划分成 许多个连续的区域(region)。采用G1算法进行回收，吸收了CMS收集器特点。
2. 并行性：G1回收期间，可有多个线程同时工作，可有效利用多核计算的能力；
3. 并发性：G1拥有与应用程序交替执行的能力，部分工作可以同时和应用程序同时执行，故发生完全阻塞的情况极少。
4. 分代GC：同时兼顾年轻代和老年代；
5.  空间整理：G1在回收过程中会进行适当的对象移动，有效的复制对象，减少空间碎片的产生；
6. 可预见性：由于分区的原因，G1可以只选取部分区域进行内存回收。
7. 特点：支持很大的堆，高吞吐量
8. 实时目标：可配置在N毫秒内最多只占用M毫秒的时间进行垃圾回收

堆内存
1. 默认堆是机器内存的1/4作为最大堆内存，如果机器的内存小于1G，则默认堆内存是机器内存的1/2。
2. 可以指定机器的最大堆内存和起始内存（-Xmx, -Xms），推荐最大堆内存和起始内存配置成一致。
3. 堆内存越大，GC频率越低，垃圾回收次数越小。
4. 每次Young区GC后，Young减少内存-堆内存减少内存 = Young晋升到Old区。
5. Full GC时，Old区也会被清理。
6. 如果堆内存很小，GC会很频繁，多次Full GC后，内存不够用，会堆内存溢出，产生Out of memory错误
7. Minor GC(小型GC), Young GC内存少，存活周期短，执行快，也叫Minor GC(小型GC)。
8. Major GC(大型GC)，Full GC内存多，执行周期长，也叫Major GC(大型GC)。
