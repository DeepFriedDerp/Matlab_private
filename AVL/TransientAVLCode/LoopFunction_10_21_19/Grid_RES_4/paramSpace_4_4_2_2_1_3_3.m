function [aeroForces] = paramSpace_4_4_2_2_1_3_3(sailStates,airStates)

	CL = (4.724999)*sailStates.alpha + (-0.479455)*sailStates.beta + (-2.904009)*sailStates.p + (42.018837)*sailStates.q + (2.346606)*sailStates.r + (0.011420)*sailStates.de;
	CD = -0.643990;
	CY = (-0.001429)*sailStates.alpha + (-0.021531)*sailStates.beta + (0.849481)*sailStates.p + (-1.057314)*sailStates.q + (-0.168934)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (1.713270)*sailStates.alpha + (-0.534304)*sailStates.beta + (-1.435790)*sailStates.p + (13.289660)*sailStates.q + (1.886028)*sailStates.r + (0.000660)*sailStates.de;
	Cm = (-12.472904)*sailStates.alpha + (1.736966)*sailStates.beta + (8.437945)*sailStates.p + (-143.598221)*sailStates.q + (-7.768355)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (-0.341506)*sailStates.alpha + (0.070989)*sailStates.beta + (-1.661118)*sailStates.p + (7.369356)*sailStates.q + (0.011994)*sailStates.r + (0.000453)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end