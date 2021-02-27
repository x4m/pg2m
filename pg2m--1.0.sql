/* contrib/pg2m/pg2m--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION pg2m" to load this file. \quit

CREATE FUNCTION pg2m_handler(internal)
RETURNS index_am_handler
AS 'MODULE_PATHNAME'
LANGUAGE C;

-- Access method
CREATE ACCESS METHOD pg2m TYPE INDEX HANDLER pg2m_handler;
COMMENT ON ACCESS METHOD pg2m IS 'pg2m index access method';

-- Opclasses

CREATE OPERATOR CLASS int4_pg2m_ops
DEFAULT FOR TYPE int4 USING pg2m AS
	OPERATOR	1	=(int4, int4);
