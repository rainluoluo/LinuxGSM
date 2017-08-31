#!/bin/bash
# LinuxGSM info_messages.sh function
# Author: Daniel Gibbs
# Website: https://gameservermanagers.com
# Description: Defines server info messages for details, alerts.

# Standard Details
# This applies to all engines

fn_info_message_head(){
	echo -e ""
	echo -e "${lightyellow}Summary${default}"
	fn_messages_separator
	echo -e "Message"
	echo -e "${alertbody}"
	echo -e ""
	echo -e "Game"
	echo -e "${gamename}"
	echo -e ""
	echo -e "Server name"
	echo -e "${servername}"
	echo -e ""
	echo -e "Hostname"
	echo -e "${HOSTNAME}"
	echo -e ""
	echo -e "Server IP"
	echo -e "${ip}:${port}"
	echo -e ""
	echo -e "More info"
	echo -e "${alerturl}"
}

fn_info_message_distro(){
	#
	# Distro Details
	# =====================================
	# Distro:    Ubuntu 14.04.4 LTS
	# Arch:      x86_64
	# Kernel:    3.13.0-79-generic
	# Hostname:  hostname
	# tmux:      tmux 1.8
	# GLIBC:     2.19

	echo -e ""
	echo -e "${lightyellow}Distro Details${default}"
	fn_messages_separator
	{
		echo -e "${blue}Distro:\t${default}${distroname}"
		echo -e "${blue}Arch:\t${default}${arch}"
		echo -e "${blue}Kernel:\t${default}${kernel}"
		echo -e "${blue}Hostname:\t${default}${HOSTNAME}"
		echo -e "${blue}tmux:\t${default}${tmuxv}"
		echo -e "${blue}GLIBC:\t${default}${glibcversion}"
	} | column -s $'\t' -t
}

fn_info_message_performance(){
	#
	# Performance
	# =====================================
	# Uptime:    55d, 3h, 38m
	# Avg Load:  1.00, 1.01, 0.78
	#
	# Mem:       total   used   free  cached
	# Physical:  741M    656M   85M   256M
	# Swap:      0B      0B     0B

	echo -e ""
	echo -e "${lightyellow}Performance${default}"

	{
		echo -e "${blue}Uptime:\t${default}${days}d, ${hours}h, ${minutes}m"
		echo -e "${blue}Avg Load:\t${default}${load}"
	} | column -s $'\t' -t
	echo -e ""
	{
		echo -e "${blue}Mem:\t${blue}total\t used\t free\t cached${default}"
		echo -e "${blue}Physical:\t${default}${physmemtotal}\t${physmemused}\t${physmemfree}\t${physmemcached}${default}"
		echo -e "${blue}Swap:\t${default}${swaptotal}\t${swapused}\t${swapfree}${default}"
	} | column -s $'\t' -t
}

fn_info_message_disk(){
	#
	# Storage
	# =====================================
	# Filesystem:   /dev/disk/by-uuid/320c8edd-a2ce-4a23-8c9d-e00a7af2d6ff
	# Total:        15G
	# Used:         8.4G
	# Available:    5.7G
	# LinuxGSM Total:	1G
	# Serverfiles:  961M
	# Backups:  	2G

	echo -e ""
	echo -e "${lightyellow}Storage${default}"
	fn_messages_separator
	{
		echo -e "${blue}Filesystem:\t${default}${filesystem}"
		echo -e "${blue}Total:\t${default}${totalspace}"
		echo -e "${blue}Used:\t${default}${usedspace}"
		echo -e "${blue}Available:\t${default}${availspace}"
		echo -e "${blue}LinuxGSM Total:\t${default}${rootdirdu}"
		echo -e "${blue}Serverfiles:\t${default}${serverfilesdu}"
		if [ -d "${backupdir}" ]; then
			echo -e "${blue}Backups:\t${default}${backupdirdu}"
		fi
	} | column -s $'\t' -t
}

fn_info_message_gameserver(){
	#
	# Quake Live Server Details
	# =====================================
	# Server name:      ql-server
	# Server IP:        1.2.3.4:27960
	# RCON password:    CHANGE_ME
	# Server password:  NOT SET
	# Maxplayers:		16
	# Status:           OFFLINE

	echo -e ""
	echo -e "${lightgreen}${gamename} Server Details${default}"
	fn_messages_separator
	{
		# Server name
		if [ -n "${servername}" ]; then
			echo -e "${blue}Server name:\t${default}${servername}"
		fi

		# Branch
		if [ -n "${branch}" ]; then
			echo -e "${blue}Branch:\t${default}${branch}"
		fi

		# Server ip
		echo -e "${blue}Server IP:\t${default}${ip}:${port}"

		# Server password
		if [ -n "${serverpassword}" ]; then
			echo -e "${blue}Server password:\t${default}${serverpassword}"
		fi

		# RCON password
		if [ -n "${rconpassword}" ]; then
			echo -e "${blue}RCON password:\t${default}${rconpassword}"
		fi

		# RCON web (Rust)
		if [ -n "${rconweb}" ]; then
			echo -e "${blue}RCON web:\t${default}${rconweb}"
		fi

		# Admin password
		if [ -n "${adminpassword}" ]; then
			echo -e "${blue}Admin password:\t${default}${adminpassword}"
		fi

		# Stats password (Quake Live)
		if [ -n "${statspassword}" ]; then
			echo -e "${blue}Stats password:\t${default}${statspassword}"
		fi

		# Maxplayers
		if [ -n "${maxplayers}" ]; then
			echo -e "${blue}Maxplayers:\t${default}${maxplayers}"
		fi

		# Game mode
		if [ -n "${gamemode}" ]; then
			echo -e "${blue}Game mode:\t${default}${gamemode}"
		fi

		# Game world
		if [ -n "${gameworld}" ]; then
			echo -e "${blue}Game world:\t${default}${gameworld}"
		fi

		# Tick rate
		if [ -n "${tickrate}" ]; then
			echo -e "${blue}Tick rate:\t${default}${tickrate}"
		fi

		# Sharding (Don't Starve Together)
		if [ -n "${sharding}" ]; then
			echo -e "${blue}Sharding:\t${default}${sharding}"
		fi

		# Master (Don't Starve Together)
		if [ -n "${master}" ]; then
			echo -e "${blue}Master:\t${default}${master}"
		fi

		# Shard (Don't Starve Together)
		if [ -n "${shard}" ]; then
			echo -e "${blue}Shard:\t${default}${shard}"
		fi

		# Cluster (Don't Starve Together)
		if [ -n "${cluster}" ]; then
			echo -e "${blue}Cluster:\t${default}${cluster}"
		fi

		# Cave (Don't Starve Together)
		if [ -n "${cave}" ]; then
			echo -e "${blue}Cave:\t${default}${cave}"
		fi

		# Creativemode (Hurtworld)
		if [ -n "${creativemode}" ]; then
			echo -e "${blue}Creativemode:\t${default}${creativemode}"
		fi

		# TeamSpeak dbplugin
		if [ -n "${dbplugin}" ]; then
			echo -e "${blue}dbplugin:\t${default}${dbplugin}"
		fi

		# ASE (Multi Theft Auto)
		if [ -n "${ase}" ]; then
			echo -e "${blue}ASE:\t${default}${ase}"
		fi

		# Save interval (Rust)
		if [ -n "${saveinterval}" ]; then
			echo -e "${blue}ASE:\t${default}${saveinterval} s"
		fi

		# Random map rotation mode (Squad)
		if [ -n "${randommap}" ]; then
			echo -e "${blue}Map rotation:\t${default}${randommap}"
		fi

		# Online status
		if [ "${status}" == "0" ]; then
			echo -e "${blue}Status:\t${red}OFFLINE${default}"
		else
			echo -e "${blue}Status:\t${green}ONLINE${default}"
		fi
	} | column -s $'\t' -t
	echo -e ""
}

fn_info_message_script(){
	#
	# qlserver Script Details
	# =====================================
	# Service name:        ql-server
	# qlserver version:    150316
	# User:                lgsm
	# Email alert:         off
	# Update on start:     off
	# Location:            /home/lgsm/qlserver
	# Config file:         /home/lgsm/qlserver/serverfiles/baseq3/ql-server.cfg

	echo -e "${lightgreen}${selfname} Script Details${default}"
	fn_messages_separator
	{
		# Service name
		echo -e "${blue}Service name:\t${default}${servicename}"

		# Script version
		if [ -n "${version}" ]; then
			echo -e "${blue}${selfname} version:\t${default}${version}"
		fi

		# User
		echo -e "${blue}User:\t${default}$(whoami)"

		# GLIBC required
		if [ -n "${glibcrequired}" ]; then
			if [ "${glibcrequired}" == "NOT REQUIRED" ]; then
					:
			elif [ "${glibcrequired}" == "UNKNOWN" ]; then
				echo -e "${blue}GLIBC required:\t${red}${glibcrequired}"
			elif [ "$(printf '%s\n'${glibcrequired}'\n' ${glibcversion} | sort -V | head -n 1)" != "${glibcrequired}" ]; then
				if [ "${glibcfix}" == "yes" ]; then
					echo -e "${blue}GLIBC required:\t${red}${glibcrequired} ${default}(${green}Using GLIBC fix${default})"
				else
					echo -e "${blue}GLIBC required:\t${red}${glibcrequired} ${default}(${red}GLIBC version too old${default})"
				fi
			else
				echo -e "${blue}GLIBC required:\t${green}${glibcrequired}${default}"
			fi
		fi

		# Email alert
		echo -e "${blue}Email alert:\t${default}${emailalert}"

		# Pushbullet alert
		echo -e "${blue}Pushbullet alert:\t${default}${pushbulletalert}"

		# Update on start
		if [ -n "${updateonstart}" ]; then
			echo -e "${blue}Update on start:\t${default}${updateonstart}"
		fi

		# Script location
		echo -e "${blue}Location:\t${default}${rootdir}"

		# Config file location
		if [ -n "${servercfgfullpath}" ]; then
			if [ -f "${servercfgfullpath}" ]; then
				echo -e "${blue}Config file:\t${default}${servercfgfullpath}"
			elif [ -d "${servercfgfullpath}" ]; then
				echo -e "${blue}Config dir:\t${default}${servercfgfullpath}"
			else
				echo -e "${blue}Config file:\t${default}${red}${servercfgfullpath}${default} (${red}FILE MISSING${default})"
			fi
		fi

		# Network config file location (ARMA 3)
		if [ -n "${networkcfgfullpath}" ]; then
			echo -e "${blue}Network config file:\t${default}${networkcfgfullpath}"
		fi
	} | column -s $'\t' -t
}

fn_info_message_backup(){
	#
	# Backups
	# =====================================
	# No. of backups:    1
	# Latest backup:
	#     date:          Fri May  6 18:34:19 UTC 2016
	#     file:          /home/lgsm/qlserver/backups/ql-server-2016-05-06-183239.tar.gz
	#     size:          945M

	echo -e ""
	echo -e "${lightgreen}Backups${default}"
	fn_messages_separator
	if [ ! -d "${backupdir}" ]||[ "${backupcount}" == "0" ]; then
		echo -e "No Backups created"
	else
		{
			echo -e "${blue}No. of backups:\t${default}${backupcount}"
			echo -e "${blue}Latest backup:${default}"
			if [ "${lastbackupdaysago}" == "0" ]; then
				echo -e "${blue}    date:\t${default}${lastbackupdate} (less than 1 day ago)"
			elif [ "${lastbackupdaysago}" == "1" ]; then
				echo -e "${blue}    date:\t${default}${lastbackupdate} (1 day ago)"
			else
				echo -e "${blue}    date:\t${default}${lastbackupdate} (${lastbackupdaysago} days ago)"
			fi
			echo -e "${blue}    file:\t${default}${lastbackup}"
			echo -e "${blue}    size:\t${default}${lastbackupsize}"
		} | column -s $'\t' -t
	fi
}

fn_info_message_commandlineparms(){
	#
	# Command-line Parameters
	# =====================================
	# ./run_server_x86.sh +set net_strict 1

	echo -e ""
	echo -e "${lightgreen}Command-line Parameters${default}"
	fn_messages_separator
	echo -e "${executable} ${parms}"
}

fn_info_message_ports(){
	# Ports
	# =====================================
	# Change ports by editing the parameters in:
	# /home/lgsm/qlserver/serverfiles/baseq3/ql-server.cfg

	echo -e ""
	echo -e "${lightgreen}Ports${default}"
	fn_messages_separator
	echo -e "Change ports by editing the parameters in:"

	parmslocation="${red}UNKNOWN${default}"
	# engines/games that require editing in the config file
	local ports_edit_array=( "avalanche" "Ballistic Overkill" "dontstarve" "idtech2" "idtech3" "idtech3_ql" "lwjgl2" "Project Cars" "projectzomboid" "quake" "refractor" "realvirtuality" "renderware" "seriousengine35" "teeworlds" "terraria" "unreal" "unreal2" "unreal3" "TeamSpeak 3" "Mumble" "7 Days To Die" )
	for port_edit in "${ports_edit_array[@]}"
	do
		if [ "${engine}" == "${port_edit}" ]||[ "${gamename}" == "${port_edit}" ]; then
			parmslocation="${servercfgfullpath}"
		fi
	done
	# engines/games that require editing in the script file
	local ports_edit_array=( "goldsource" "Factorio" "Hurtworld" "iw3.0"  "Rust" "spark" "source" "starbound" "unreal4" "realvirtuality")
	for port_edit in "${ports_edit_array[@]}"
	do
		if [ "${engine}" == "${port_edit}" ]||[ "${gamename}" == "${port_edit}" ]; then
			parmslocation="${selfname}"
		fi
	done
	echo -e "${parmslocation}"
	echo -e ""
	echo -e "Useful port diagnostic command:"
}

fn_info_message_statusbottom(){
	echo -e ""
	if [ "${status}" == "0" ]; then
		echo -e "${blue}Status:\t${red}OFFLINE${default}"
	else
		echo -e "${blue}Status:\t${green}ONLINE${default}"
	fi
	echo -e ""
}

# Engine/Game Specific details

fn_info_message_ark(){
	echo -e "netstat -atunp | grep ShooterGame"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\tudp"
		# Don't do arithmetics if ever the port wasn't a numeric value
		if [ "${port}" -eq "${port}" ]; then
			echo -e "> RAW\tINBOUND\t$((port+1))\tudp"
		fi
		echo -e "> Query\tINBOUND\t${queryport}\tudp"
		echo -e "> RCON\tINBOUND\t${rconport}\ttcp"
	} | column -s $'\t' -t
}

fn_info_message_ballisticoverkill(){
	echo -e "netstat -atunp | grep BODS.x86"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game/RCON\tINBOUND\t${port}\tudp"
		echo -e "> Query\tINBOUND\t${queryport}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_avalanche(){
	echo -e "netstat -atunp | grep Jcmp-Server"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_cod(){
	echo -e "netstat -atunp | grep cod_lnxded"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_coduo(){
	echo -e "netstat -atunp | grep coduo_lnxded"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_cod2(){
	echo -e "netstat -atunp | grep cod2_lnxded"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_cod4(){
	echo -e "netstat -atunp"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_codwaw(){
	echo -e "netstat -atunp | grep codwaw_lnxded"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_dontstarve(){
	echo -e "netstat -atunp | grep dontstarve"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game: Server\tINBOUND\t${port}\tudp"
		echo -e "> Game: Master\tINBOUND\t${masterport}\tudp"
		echo -e "> Steam: Auth\tINBOUND\t${steamauthenticationport}\tudp"
		echo -e "> Steam: Master\tINBOUND\t${steammasterserverport}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_factorio(){
	echo -e "netstat -atunp | grep factorio"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\ttcp"
	} | column -s $'\t' -t
}

fn_info_message_goldsource(){
	echo -e "netstat -atunp | grep hlds_linux"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game/RCON\tINBOUND\t${port}\ttcp/udp"
		echo -e "< Client\tOUTBOUND\t${clientport}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_hurtworld(){
	echo -e "netstat -atunp | grep Hurtworld"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game/RCON\tINBOUND\t${port}\tudp"
		echo -e "> Query\tINBOUND\t${queryport}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_minecraft(){
	echo -e "netstat -atunp | grep java"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_mumble(){
	echo -e "netstat -atunp | grep murmur"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Voice\tINBOUND\t${port}\tudp"
		echo -e "> ServerQuery\tINBOUND\t${port}\ttcp"
	} | column -s $'\t' -t
}

fn_info_message_projectcars(){
	echo -e "netstat -atunp | grep DedicatedS"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\tudp"
		echo -e "> Query\tINBOUND\t${queryport}\tudp"
		echo -e "> Steam\tINBOUND\t${steamport}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_projectzomboid(){
	echo -e "netstat -atunp | grep java"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_quake(){
	echo -e "netstat -atunp | grep mvdsv"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_quake2(){
	echo -e "netstat -atunp | grep quake2"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_quake3(){
	echo -e "netstat -atunp | grep q3ded"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_quakelive(){
	echo -e "netstat -atunp | grep qzeroded"
	echo -e ""
	if [ -z "${port}" ]||[ -z "${rconport}" ]||[ -z "${statsport}" ]; then
		echo -e "${red}ERROR!${default} Missing/commented ports in ${servercfg}."
		echo -e ""
	fi
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\tudp"
		echo -e "> Rcon\tINBOUND\t${rconport}\tudp"
		echo -e "> Stats\tINBOUND\t${statsport}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_realvirtuality(){
	echo -e "netstat -atunp | grep arma3server"
	echo -e ""
	# Default port
	if [ -z "${port}" ]; then
		port="2302"
	fi
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\tudp"
		# Don't do arithmetics if ever the port wasn't a numeric value
		if [ "${port}" -eq "${port}" ]; then
			echo -e "> Steam: Query\tINBOUND\t$((port+1))\tudp"
			echo -e "> Steam: Master traffic\tINBOUND\t$((port+2))\tudp"
			echo -e "> Undocumented Port\tINBOUND\t$((port+3))\tudp"
		fi
	} | column -s $'\t' -t
}

fn_info_message_refractor(){
	echo -e "netstat -atunp | grep bf1942_lnxd"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game/Query\tINBOUND\t${port}\tudp"
		echo -e "> Steam: Query\tINBOUND\t${queryport}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_rust(){
	echo -e "netstat -atunp | grep Rust"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game/Query\tINBOUND\t${port}\ttcp/udp"
		echo -e "> RCON\tINBOUND\t${rconport}\ttcp"
	} | column -s $'\t' -t
}

fn_info_message_seriousengine35(){
	echo -e "netstat -atunp | grep Sam3_Dedicate"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game/RCON\tINBOUND\t${port}\ttcp"
		echo -e "> Query\tINBOUND\t${queryport}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_sdtd(){
	echo -e "netstat -atunp | grep 7DaysToDie"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game/RCON\tINBOUND\t${port}\tudp"
		echo -e "> Query\tINBOUND\t${queryport}\tudp"
		echo -e "> WebAdmin\tINBOUND\t${webadminport}\ttcp"
		echo -e "> Telnet\tINBOUND\t${telnetport}\ttcp"
	} | column -s $'\t' -t
	echo -e ""
	echo -e "${lightgreen}${servername} WebAdmin${default}"
	fn_messages_separator
	{
		echo -e "${blue}WebAdmin enabled:\t${default}${webadminenabled}"
		echo -e "${blue}WebAdmin url:\t${default}http://${ip}:${webadminport}"
		echo -e "${blue}WebAdmin password:\t${default}${webadminpass}"
	} | column -s $'\t' -t
	echo -e ""
	echo -e "${lightgreen}${servername} Telnet${default}"
	fn_messages_separator
	{
		echo -e "${blue}Telnet enabled:\t${default}${telnetenabled}"
		echo -e "${blue}Telnet address:\t${default}${ip} ${telnetport}"
		echo -e "${blue}Telnet password:\t${default}${telnetpass}"
	} | column -s $'\t' -t
}

fn_info_message_source(){
	echo -e "netstat -atunp | grep srcds_linux"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game/RCON\tINBOUND\t${port}\ttcp/udp"
		echo -e "> SourceTV\tINBOUND\t${sourcetvport}\tudp"
		echo -e "< Client\tOUTBOUND\t${clientport}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_spark(){
	echo -e "netstat -atunp | grep server_linux3"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game/RCON\tINBOUND\t${port}\tudp"
		echo -e "> Query\tINBOUND\t${queryport}\tudp"
		echo -e "> WebAdmin\tINBOUND\t${webadminport}\ttcp"
	} | column -s $'\t' -t
	echo -e ""
	echo -e "${lightgreen}${servername} WebAdmin${default}"
	fn_messages_separator
	{
		echo -e "${blue}WebAdmin url:\t${default}http://${ip}:${webadminport}/index.html"
		echo -e "${blue}WebAdmin username:\t${default}${webadminuser}"
		echo -e "${blue}WebAdmin password:\t${default}${webadminpass}"
	} | column -s $'\t' -t
}

fn_info_message_squad(){
	echo -e "netstat -atunp | grep SquadServer"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\tudp"
		echo -e "> Query\tINBOUND\t${queryport}\tudp"
		echo -e "> RCON\tINBOUND\t${rconport}\ttcp"
	} | column -s $'\t' -t
}

fn_info_message_starbound(){
	echo -e "netstat -atunp | grep starbound"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\ttcp"
		echo -e "> Query\tINBOUND\t${queryport}\ttcp"
		echo -e "> Rcon\tINBOUND\t${rconport}\ttcp"
	} | column -s $'\t' -t
}

fn_info_message_teamspeak3(){
	echo -e "netstat -atunp | grep ts3server"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Voice\tINBOUND\t${port}\tudp"
		echo -e "> ServerQuery\tINBOUND\t${queryport}\ttcp"
		echo -e "> File transfer\tINBOUND\t${fileport}\ttcp"
	} | column -s $'\t' -t
}

fn_info_message_teeworlds(){
	echo -e "netstat -atunp | grep teeworlds_srv"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\ttcp"
	} | column -s $'\t' -t
}

fn_info_message_terraria(){
	echo -e "netstat -atunp | grep TerrariaServer"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\ttcp"
	} | column -s $'\t' -t
}

fn_info_message_towerunite(){
	echo -e "netstat -atunp | grep TowerServer"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tINBOUND\t${port}\ttcp"
		# Don't do arithmetics if ever the port wasn't a numeric value
		if [ "${port}" -eq "${port}" ]; then
			echo -e "> Steam\tINBOUND\t$((port+1))\tudp"
		fi
		echo -e "> Query\tINBOUND\t${queryport}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_unreal(){
	echo -e "netstat -atunp | grep ucc-bin"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL\tINI VARIABLE"
		echo -e "> Game\tINBOUND\t${port}\tudp\tPort=${port}"
		echo -e "> Query\tINBOUND\t${queryport}\tudp"
		if [ "${engine}" == "unreal" ]; then
			echo -e "< UdpLink Port (random)\tOUTBOUND\t${udplinkport}+\tudp"
		fi
		if [ "${engine}" != "unreal" ] && [ "${appid}" != "223250" ]; then
			echo -e "> GameSpy query\tINBOUND\t${gsqueryport}\tudp\tOldQueryPortNumber=${gsqueryport}"
		fi
		if [ "${appid}" == "215360" ]; then
			echo -e "< Master server\tOUTBOUND\t28852\ttcp/udp"
		else
			echo -e "< Master server\tOUTBOUND\t28900/28902\ttcp/udp"
		fi
		if [ "${appid}" ]; then
			if [ "${appid}" == "223250" ]; then
				echo -e "< Steam\tOUTBOUND\t20610\tudp"
			else
				echo -e "< Steam\tOUTBOUND\t20660\tudp"
			fi
		fi
		echo -e "> WebAdmin\tINBOUND\t${webadminport}\ttcp\tListenPort=${webadminport}"
	} | column -s $'\t' -t
	echo -e ""
	echo -e "${lightgreen}${servername} WebAdmin${default}"
	fn_messages_separator
	{
		echo -e "${blue}WebAdmin enabled:\t${default}${webadminenabled}"
		echo -e "${blue}WebAdmin url:\t${default}http://${ip}:${webadminport}"
		echo -e "${blue}WebAdmin username:\t${default}${webadminuser}"
		echo -e "${blue}WebAdmin password:\t${default}${webadminpass}"
	} | column -s $'\t' -t
}

fn_info_message_ut3(){
	echo -e "netstat -atunp | grep ut3-bin"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game/Query\tINBOUND\t${port}\ttcp/udp"
	} | column -s $'\t' -t
}

fn_info_message_wolfensteinenemyterritory(){
	echo -e "netstat -atunp | grep etded"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game/Query\tINBOUND\t${port}\tudp"
	} | column -s $'\t' -t
}

fn_info_message_mta(){
	echo -e "netstat -atunp | grep mta-server64"
	echo -e ""
	{
		echo -e "DESCRIPTION\tDIRECTION\tPORT\tPROTOCOL"
		echo -e "> Game\tOUTBOUND\t${port}\tudp"
		echo -e "> HTTP Server\tINBOUND\t${httpport}\ttcp"
		if [ "${ase}" == "Enabled" ]; then
			echo -e "> ASE Game_Monitor\tOUTBOUND\t$((${port} + 123))\tudp"
		fi
	} | column -s $'\t' -t
}

fn_info_message_select_engine(){
	# Display details depending on game or engine.
	if [ "${engine}" == "avalanche" ]; then
		fn_info_message_avalanche
	elif [ "${engine}" == "refractor" ]; then
		fn_info_message_refractor
	elif [ "${engine}" == "dontstarve" ]; then
		fn_info_message_dontstarve
	elif [ "${engine}" == "goldsource" ]; then
		fn_info_message_goldsource
	elif [ "${engine}" == "lwjgl2" ]; then
		fn_info_message_minecraft
	elif [ "${engine}" == "projectzomboid" ]; then
		fn_info_message_projectzomboid
	elif [ "${engine}" == "realvirtuality" ]; then
		fn_info_message_realvirtuality
	elif [ "${engine}" == "seriousengine35" ]; then
		fn_info_message_seriousengine35
	elif [ "${engine}" == "source" ]; then
		fn_info_message_source
	elif [ "${engine}" == "spark" ]; then
		fn_info_message_spark
	elif [ "${engine}" == "starbound" ]; then
		fn_info_message_starbound
	elif [ "${engine}" == "teeworlds" ]; then
		fn_info_message_teeworlds
	elif [ "${engine}" == "terraria" ]; then
		fn_info_message_terraria
	elif [ "${engine}" == "unreal" ]||[ "${engine}" == "unreal2" ]; then
		fn_info_message_unreal
	elif [ "${engine}" == "unreal3" ]; then
		fn_info_message_ut3
	elif [ "${gamename}" == "7 Days To Die" ]; then
		fn_info_message_sdtd
	elif [ "${gamename}" == "ARK: Survival Evolved" ]; then
		fn_info_message_ark
	elif [ "${gamename}" == "Ballistic Overkill" ]; then
		fn_info_message_ballisticoverkill
	elif [ "${gamename}" == "Call of Duty" ]; then
		fn_info_message_cod
	elif [ "${gamename}" == "Call of Duty: United Offensive" ]; then
		fn_info_message_coduo
	elif [ "${gamename}" == "Call of Duty 2" ]; then
		fn_info_message_cod2
	elif [ "${gamename}" == "Call of Duty 4" ]; then
		fn_info_message_cod4
	elif [ "${gamename}" == "Call of Duty: World at War" ]; then
		fn_info_message_codwaw
	elif [ "${gamename}" == "Factorio" ]; then
		fn_info_message_factorio
	elif [ "${gamename}" == "Hurtworld" ]; then
		fn_info_message_hurtworld
	elif [ "${gamename}" == "Project Cars" ]; then
		fn_info_message_projectcars
	elif [ "${gamename}" == "QuakeWorld" ]; then
		fn_info_message_quake
	elif [ "${gamename}" == "Quake 2" ]; then
		fn_info_message_quake2
	elif [ "${gamename}" == "Quake 3: Arena" ]; then
		fn_info_message_quake3
	elif [ "${gamename}" == "Quake Live" ]; then
		fn_info_message_quakelive
	elif [ "${gamename}" == "Squad" ]; then
		fn_info_message_squad
	elif [ "${gamename}" == "TeamSpeak 3" ]; then
		fn_info_message_teamspeak3
	elif [ "${gamename}" == "Tower Unite" ]; then
		fn_info_message_towerunite
	elif [ "${gamename}" == "Multi Theft Auto" ]; then
		fn_info_message_mta
	elif [ "${gamename}" == "Mumble" ]; then
		fn_info_message_mumble
	elif [ "${gamename}" == "Rust" ]; then
		fn_info_message_rust
	elif [ "${gamename}" == "Wolfenstein: Enemy Territory" ]; then
		fn_info_message_wolfensteinenemyterritory
	else
		fn_print_error_nl "Unable to detect server engine."
	fi
}

# Separator is different for details
fn_messages_separator(){
	if [ "${function_selfname}" == "command_details.sh" ]; then
		printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
	else
		echo -e "================================="
	fi
}