function [aeroForces] = paramSpace_1_2_1_3_2_2_3(sailStates,airStates)

	CL = (3.770086)*sailStates.alpha + (-0.083725)*sailStates.beta + (-2.729680)*sailStates.p + (37.492233)*sailStates.q + (-1.100478)*sailStates.r + (0.010628)*sailStates.de;
	CD = 0.098850;
	CY = (-0.005768)*sailStates.alpha + (-0.025204)*sailStates.beta + (-0.274428)*sailStates.p + (0.194783)*sailStates.q + (-0.054608)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.309471)*sailStates.alpha + (0.104151)*sailStates.beta + (-1.384067)*sailStates.p + (12.090315)*sailStates.q + (-0.798611)*sailStates.r + (0.000709)*sailStates.de;
	Cm = (-13.263217)*sailStates.alpha + (0.329989)*sailStates.beta + (8.965722)*sailStates.p + (-141.871536)*sailStates.q + (3.726449)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (0.238591)*sailStates.alpha + (0.024468)*sailStates.beta + (0.361878)*sailStates.p + (-0.709100)*sailStates.q + (-0.032353)*sailStates.r + (-0.000070)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end