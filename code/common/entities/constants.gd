extends Node

signal change_mode

enum ELEMENTS
{
	EARTH,
	WATER,
	FIRE,
	AIR,
	DARK,
	LIGHT,
	AETHER,
	FIGMENT,
	VOID,
}

enum STARSIGNS
{
	ARIES,
	TAURUS,
	GEMINI,
	CANCER,
	LEO,
	VIRGO,
	LIBRA,
	SCORPIO,
	SAGITTARIUS,
	CAPRICORN,
	AQUARIUS,
	PISCES,
}

enum EQUIP_SLOTS
{
	HEAD = 1 << 0,
	CHEST = 1 << 0,
	BOOTS = 1 << 2,
	L_HAND = 1 << 3,
	R_HAND = 1 << 4,
	
	TWO_HAND = L_HAND | R_HAND,
	COWL = HEAD | CHEST
}

enum LISTENERS
{
	JUMPED,
	MOVED,
	STOPPED,
	PEAKED,
	FELL,
	RECOVERED,
	WASHIT,
	SCOREDHIT,
	DIED,
	LANDED,
}

const listeners: Array[String] = [
	"jumped",
	"moved",
	"stopped",
	"peaked",
	"fell",
	"recovered",
	"was_hit",
	"scored_hit",
	"died",
	"landed",
]
