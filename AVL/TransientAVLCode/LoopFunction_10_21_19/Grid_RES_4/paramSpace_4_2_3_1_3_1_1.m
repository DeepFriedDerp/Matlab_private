function [aeroForces] = paramSpace_4_2_3_1_3_1_1(sailStates,airStates)

	CL = (6.440230)*sailStates.alpha + (-0.138202)*sailStates.beta + (-1.506839)*sailStates.p + (19.835169)*sailStates.q + (-2.031174)*sailStates.r + (0.008659)*sailStates.de;
	CD = -2.634350;
	CY = (0.670930)*sailStates.alpha + (-0.022421)*sailStates.beta + (-1.172924)*sailStates.p + (2.326708)*sailStates.q + (0.233392)*sailStates.r + (0.000486)*sailStates.de;

	Cl = (1.890297)*sailStates.alpha + (0.445847)*sailStates.beta + (-0.455968)*sailStates.p + (1.188421)*sailStates.q + (-2.027129)*sailStates.r + (-0.000626)*sailStates.de;
	Cm = (-18.306412)*sailStates.alpha + (0.516438)*sailStates.beta + (7.457791)*sailStates.p + (-113.341965)*sailStates.q + (6.584334)*sailStates.r + (-0.065707)*sailStates.de;
	Cn = (-2.571940)*sailStates.alpha + (-0.104779)*sailStates.beta + (2.670532)*sailStates.p + (-13.842129)*sailStates.q + (-0.110058)*sailStates.r + (-0.000851)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end