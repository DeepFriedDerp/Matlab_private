function [aeroForces] = paramSpace_4_3_4_2_2_3_1(sailStates,airStates)

	CL = (4.426570)*sailStates.alpha + (-0.151275)*sailStates.beta + (-2.169001)*sailStates.p + (35.654186)*sailStates.q + (1.865165)*sailStates.r + (0.011031)*sailStates.de;
	CD = -0.477830;
	CY = (-0.073713)*sailStates.alpha + (-0.025328)*sailStates.beta + (0.664078)*sailStates.p + (0.301042)*sailStates.q + (-0.132061)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.148715)*sailStates.alpha + (-0.382171)*sailStates.beta + (-0.853253)*sailStates.p + (7.599992)*sailStates.q + (1.529722)*sailStates.r + (-0.000219)*sailStates.de;
	Cm = (-11.743258)*sailStates.alpha + (0.592688)*sailStates.beta + (6.238138)*sailStates.p + (-123.990753)*sailStates.q + (-6.225403)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (0.523053)*sailStates.alpha + (0.067624)*sailStates.beta + (-1.373950)*sailStates.p + (5.439844)*sailStates.q + (0.002415)*sailStates.r + (0.000003)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end