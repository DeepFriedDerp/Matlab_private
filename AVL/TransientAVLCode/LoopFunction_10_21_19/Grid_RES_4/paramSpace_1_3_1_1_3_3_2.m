function [aeroForces] = paramSpace_1_3_1_1_3_3_2(sailStates,airStates)

	CL = (4.974262)*sailStates.alpha + (-0.076220)*sailStates.beta + (-2.260103)*sailStates.p + (27.696960)*sailStates.q + (0.827456)*sailStates.r + (0.008926)*sailStates.de;
	CD = -1.467810;
	CY = (0.184010)*sailStates.alpha + (-0.023033)*sailStates.beta + (0.524207)*sailStates.p + (1.664521)*sailStates.q + (0.104092)*sailStates.r + (0.000352)*sailStates.de;

	Cl = (1.085149)*sailStates.alpha + (-0.346290)*sailStates.beta + (-1.062455)*sailStates.p + (7.704161)*sailStates.q + (1.029404)*sailStates.r + (0.000178)*sailStates.de;
	Cm = (-15.340060)*sailStates.alpha + (0.288436)*sailStates.beta + (9.059731)*sailStates.p + (-132.472137)*sailStates.q + (-2.640786)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.326338)*sailStates.alpha + (-0.063456)*sailStates.beta + (-1.445922)*sailStates.p + (6.004008)*sailStates.q + (-0.040715)*sailStates.r + (-0.000330)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end