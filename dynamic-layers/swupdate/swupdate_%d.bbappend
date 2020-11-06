FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# With latest swupdate, libubootenv is provided by libubootenv.bb
# For now, use libubootenv provided by legacy u-boot-fw-utils instead
python () {
    depends = d.getVar('DEPENDS', False)
    d.setVar('DEPENDS', depends.replace("libubootenv","u-boot-fw-utils"))
}

SRC_URI += "\
	file://background.jpg \
	file://favicon.png \
	file://logo.png \
	file://swupdate.cfg \
	file://swupdate.default \
"

do_install_append () {
	install -m 644 ${WORKDIR}/background.jpg ${D}/www/images/
	install -m 644 ${WORKDIR}/favicon.png ${D}/www/images/
	install -m 644 ${WORKDIR}/logo.png ${D}/www/images/
	install -m 644 ${WORKDIR}/swupdate.cfg ${D}${sysconfdir}/
	install -d ${D}${sysconfdir}/default/
	install -m 644 ${WORKDIR}/swupdate.default ${D}${sysconfdir}/default/swupdate
}
