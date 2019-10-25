function [aeroForces] = paramSpace_1_3_1_2_3_1_1(sailStates,airStates)

	CL = (4.701526)*sailStates.alpha + (0.404752)*sailStates.beta + (-2.143170)*sailStates.p + (35.086605)*sailStates.q + (-1.960960)*sailStates.r + (0.010947)*sailStates.de;
	CD = -0.626270;
	CY = (0.198353)*sailStates.alpha + (-0.023471)*sailStates.beta + (-0.765164)*sailStates.p + (0.491414)*sailStates.q + (-0.134966)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.342029)*sailStates.alpha + (0.468286)*sailStates.beta + (-0.812939)*sailStates.p + (7.115693)*sailStates.q + (-1.617475)*sailStates.r + (-0.000336)*sailStates.de;
	Cm = (-12.309960)*sailStates.alpha + (-1.575093)*sailStates.beta + (6.150306)*sailStates.p + (-122.751358)*sailStates.q + (6.552953)*sailStates.r + (-0.066320)*sailStates.de;
	Cn = (-0.757797)*sailStates.alpha + (0.058506)*sailStates.beta + (1.597274)*sailStates.p + (-7.166529)*sailStates.q + (0.021536)*sailStates.r + (-0.000243)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end