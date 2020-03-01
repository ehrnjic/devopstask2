# Work and changes description

Due to the fact that app repo last commit was done 17 months ago, I have considered
that given requirements for nodejs are deprecated so I installed next supported version 10.x.
Simple node app works just fine with node v10.x.

For guest os I choose Debian 9 (Stretch) because it still have openjdk-1.8 in official package repos.

In my opinion, it would be best to use a "manual baked box" for this case. 
Box where major (Java, PG, Node) dependencies would already be installed to avoid problems with dependencies updates over time.
