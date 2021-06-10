GHC = ghc -O2 -threaded
build: Programs/SendJunk.hs Programs/Ten.hs Programs/CrapSum.hs Resource/Bullshit.hs Resource/Mail.hs Resource/PGP.hs ten.1 crapsum.1 sendjunk.1
	ghc -O2 -package random dtd.hs
	-rm *.hi *.o Resource/*[!s] */*.hi */*.o
	-rm ten sendjunk crapsum256 crapsum512
	ln -s dtd ten
	ln -s dtd sendjunk
	ln -s dtd crapsum256
	ln -s dtd crapsum512
install:
	mv ten sendjunk crapsum256 crapsum512 dtd /usr/local/sbin/
uninstall:
	rm /usr/local/sbin/ten /usr/local/sbin/sendjunk /usr/local/sbin/crapsum256 /usr/local/sbin/crapsum512 /usr/local/sbin/dtd
