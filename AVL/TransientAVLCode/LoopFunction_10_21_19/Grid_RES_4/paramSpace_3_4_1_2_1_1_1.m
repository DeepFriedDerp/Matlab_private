function [aeroForces] = paramSpace_3_4_1_2_1_1_1(sailStates,airStates)

	CL = (4.229731)*sailStates.alpha + (0.177394)*sailStates.beta + (-2.111155)*sailStates.p + (30.254562)*sailStates.q + (-0.541987)*sailStates.r + (0.010491)*sailStates.de;
	CD = -0.336580;
	CY = (-0.028512)*sailStates.alpha + (-0.024285)*sailStates.beta + (-0.315844)*sailStates.p + (-0.668511)*sailStates.q + (0.020772)*sailStates.r + (-0.000142)*sailStates.de;

	Cl = (0.892668)*sailStates.alpha + (0.220344)*sailStates.beta + (-0.808448)*sailStates.p + (5.752425)*sailStates.q + (-0.634440)*sailStates.r + (-0.000329)*sailStates.de;
	Cm = (-14.636253)*sailStates.alpha + (-0.804525)*sailStates.beta + (7.487701)*sailStates.p + (-124.743294)*sailStates.q + (1.873783)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (-0.350080)*sailStates.alpha + (-0.011054)*sailStates.beta + (0.755626)*sailStates.p + (-2.911188)*sailStates.q + (-0.004892)*sailStates.r + (0.000142)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end