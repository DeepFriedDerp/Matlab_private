function [aeroForces] = paramSpace_1_4_2_1_3_1_1(sailStates,airStates)

	CL = (7.385566)*sailStates.alpha + (0.749497)*sailStates.beta + (-1.729683)*sailStates.p + (35.978931)*sailStates.q + (-3.317760)*sailStates.r + (0.011581)*sailStates.de;
	CD = -3.003600;
	CY = (0.692090)*sailStates.alpha + (-0.021492)*sailStates.beta + (-1.418339)*sailStates.p + (1.002330)*sailStates.q + (-0.282161)*sailStates.r + (0.000207)*sailStates.de;

	Cl = (2.239074)*sailStates.alpha + (0.866903)*sailStates.beta + (-0.430573)*sailStates.p + (4.682534)*sailStates.q + (-2.831603)*sailStates.r + (-0.001005)*sailStates.de;
	Cm = (-10.135606)*sailStates.alpha + (-2.834502)*sailStates.beta + (3.310736)*sailStates.p + (-107.565659)*sailStates.q + (10.947542)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (-2.738084)*sailStates.alpha + (0.115615)*sailStates.beta + (3.151864)*sailStates.p + (-14.941755)*sailStates.q + (0.080735)*sailStates.r + (-0.000476)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end