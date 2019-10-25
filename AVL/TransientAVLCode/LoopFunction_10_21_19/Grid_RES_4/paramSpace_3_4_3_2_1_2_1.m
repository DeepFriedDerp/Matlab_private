function [aeroForces] = paramSpace_3_4_3_2_1_2_1(sailStates,airStates)

	CL = (3.980877)*sailStates.alpha + (-0.100373)*sailStates.beta + (-2.137078)*sailStates.p + (31.494896)*sailStates.q + (0.483192)*sailStates.r + (0.010672)*sailStates.de;
	CD = 0.014020;
	CY = (-0.115340)*sailStates.alpha + (-0.024002)*sailStates.beta + (0.190489)*sailStates.p + (-0.668511)*sailStates.q + (-0.012509)*sailStates.r + (-0.000142)*sailStates.de;

	Cl = (0.967452)*sailStates.alpha + (-0.096542)*sailStates.beta + (-0.816567)*sailStates.p + (6.072791)*sailStates.q + (0.356512)*sailStates.r + (-0.000329)*sailStates.de;
	Cm = (-14.295753)*sailStates.alpha + (0.388846)*sailStates.beta + (7.257462)*sailStates.p + (-124.743294)*sailStates.q + (-1.638987)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (0.219025)*sailStates.alpha + (0.003460)*sailStates.beta + (-0.358629)*sailStates.p + (1.976664)*sailStates.q + (0.003653)*sailStates.r + (0.000211)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end