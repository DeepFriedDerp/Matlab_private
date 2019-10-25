function [aeroForces] = paramSpace_2_1_3_1_1_1_2(sailStates,airStates)

	CL = (4.313087)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.092765)*sailStates.p + (44.243591)*sailStates.q + (-2.313689)*sailStates.r + (0.011873)*sailStates.de;
	CD = -0.605730;
	CY = (-0.238936)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.734911)*sailStates.p + (-0.550478)*sailStates.q + (-0.156230)*sailStates.r + (-0.000118)*sailStates.de;

	Cl = (1.267371)*sailStates.alpha + (0.389267)*sailStates.beta + (-1.610695)*sailStates.p + (15.056220)*sailStates.q + (-1.886756)*sailStates.r + (0.001055)*sailStates.de;
	Cm = (-11.075478)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.109568)*sailStates.p + (-149.810104)*sailStates.q + (7.670701)*sailStates.r + (-0.069050)*sailStates.de;
	Cn = (0.765109)*sailStates.alpha + (0.082741)*sailStates.beta + (1.400371)*sailStates.p + (-4.697598)*sailStates.q + (-0.030600)*sailStates.r + (0.000009)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end