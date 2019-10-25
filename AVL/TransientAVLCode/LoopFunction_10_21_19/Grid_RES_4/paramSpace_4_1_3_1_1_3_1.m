function [aeroForces] = paramSpace_4_1_3_1_1_3_1(sailStates,airStates)

	CL = (7.385566)*sailStates.alpha + (0.749497)*sailStates.beta + (-1.729683)*sailStates.p + (35.978939)*sailStates.q + (3.317759)*sailStates.r + (0.011581)*sailStates.de;
	CD = -3.003600;
	CY = (-0.692090)*sailStates.alpha + (-0.028080)*sailStates.beta + (1.418339)*sailStates.p + (-1.002330)*sailStates.q + (-0.282161)*sailStates.r + (-0.000207)*sailStates.de;

	Cl = (2.386454)*sailStates.alpha + (-0.456447)*sailStates.beta + (-0.524946)*sailStates.p + (5.870416)*sailStates.q + (2.850417)*sailStates.r + (-0.000755)*sailStates.de;
	Cm = (-10.135605)*sailStates.alpha + (-2.834502)*sailStates.beta + (3.310736)*sailStates.p + (-107.565659)*sailStates.q + (-10.947543)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (2.527118)*sailStates.alpha + (0.147615)*sailStates.beta + (-3.133092)*sailStates.p + (14.705471)*sailStates.q + (0.076992)*sailStates.r + (0.000476)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end