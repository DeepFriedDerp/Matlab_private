function [aeroForces] = paramSpace_2_1_3_2_3_1_1(sailStates,airStates)

	CL = (4.655429)*sailStates.alpha + (-0.208523)*sailStates.beta + (-2.158592)*sailStates.p + (31.473167)*sailStates.q + (-1.198540)*sailStates.r + (0.010777)*sailStates.de;
	CD = -0.555700;
	CY = (0.192666)*sailStates.alpha + (-0.024637)*sailStates.beta + (-0.583013)*sailStates.p + (0.771087)*sailStates.q + (0.000072)*sailStates.r + (0.000164)*sailStates.de;

	Cl = (1.401189)*sailStates.alpha + (0.188630)*sailStates.beta + (-0.920444)*sailStates.p + (7.206067)*sailStates.q + (-1.077060)*sailStates.r + (-0.000069)*sailStates.de;
	Cm = (-14.813147)*sailStates.alpha + (0.746805)*sailStates.beta + (7.425094)*sailStates.p + (-125.620300)*sailStates.q + (4.042584)*sailStates.r + (-0.068473)*sailStates.de;
	Cn = (-0.676875)*sailStates.alpha + (-0.000405)*sailStates.beta + (1.297789)*sailStates.p + (-6.588153)*sailStates.q + (-0.000281)*sailStates.r + (-0.000331)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end