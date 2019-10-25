function [aeroForces] = paramSpace_4_3_3_1_3_1_1(sailStates,airStates)

	CL = (6.440229)*sailStates.alpha + (0.138202)*sailStates.beta + (-1.506839)*sailStates.p + (19.835169)*sailStates.q + (-2.031175)*sailStates.r + (0.008659)*sailStates.de;
	CD = -2.634350;
	CY = (0.670930)*sailStates.alpha + (-0.027531)*sailStates.beta + (-1.172924)*sailStates.p + (2.326708)*sailStates.q + (0.233392)*sailStates.r + (0.000486)*sailStates.de;

	Cl = (1.822788)*sailStates.alpha + (0.541723)*sailStates.beta + (-0.424430)*sailStates.p + (0.791453)*sailStates.q + (-2.033417)*sailStates.r + (-0.000710)*sailStates.de;
	Cm = (-18.306410)*sailStates.alpha + (-0.516438)*sailStates.beta + (7.457790)*sailStates.p + (-113.341965)*sailStates.q + (6.584334)*sailStates.r + (-0.065707)*sailStates.de;
	Cn = (-2.603317)*sailStates.alpha + (-0.091661)*sailStates.beta + (2.664259)*sailStates.p + (-13.763168)*sailStates.q + (-0.108807)*sailStates.r + (-0.000851)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end