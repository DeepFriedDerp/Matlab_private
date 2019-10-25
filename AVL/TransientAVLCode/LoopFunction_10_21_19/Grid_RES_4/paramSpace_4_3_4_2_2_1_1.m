function [aeroForces] = paramSpace_4_3_4_2_2_1_1(sailStates,airStates)

	CL = (4.025278)*sailStates.alpha + (0.007720)*sailStates.beta + (-2.014665)*sailStates.p + (28.449541)*sailStates.q + (-0.180682)*sailStates.r + (0.009613)*sailStates.de;
	CD = -0.283350;
	CY = (0.082172)*sailStates.alpha + (-0.025328)*sailStates.beta + (-0.273296)*sailStates.p + (0.301045)*sailStates.q + (0.054394)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.002716)*sailStates.alpha + (0.130637)*sailStates.beta + (-0.804408)*sailStates.p + (5.697816)*sailStates.q + (-0.367239)*sailStates.r + (-0.000219)*sailStates.de;
	Cm = (-14.728428)*sailStates.alpha + (-0.013729)*sailStates.beta + (7.575636)*sailStates.p + (-123.990753)*sailStates.q + (0.498655)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (-0.505469)*sailStates.alpha + (-0.022377)*sailStates.beta + (0.758875)*sailStates.p + (-4.123039)*sailStates.q + (-0.046343)*sailStates.r + (-0.000161)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end