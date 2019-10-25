function [aeroForces] = paramSpace_10_1_4_2_1_2_2(sailStates,airStates)

	CL = (4.272118)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.791617)*sailStates.p + (37.478352)*sailStates.q + (1.043428)*sailStates.r + (0.011249)*sailStates.de;
	CD = -0.158890;
	CY = (-0.021155)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.432254)*sailStates.p + (-0.466416)*sailStates.q + (-0.030275)*sailStates.r + (-0.000101)*sailStates.de;

	Cl = (1.456985)*sailStates.alpha + (-0.197282)*sailStates.beta + (-1.384940)*sailStates.p + (11.610433)*sailStates.q + (0.894475)*sailStates.r + (0.000618)*sailStates.de;
	Cm = (-14.354627)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.285619)*sailStates.p + (-142.955811)*sailStates.q + (-3.561465)*sailStates.r + (-0.070744)*sailStates.de;
	Cn = (-0.033844)*sailStates.alpha + (0.013795)*sailStates.beta + (-0.854288)*sailStates.p + (3.786728)*sailStates.q + (0.003734)*sailStates.r + (0.000190)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end