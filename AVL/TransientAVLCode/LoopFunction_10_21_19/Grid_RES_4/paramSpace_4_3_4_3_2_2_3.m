function [aeroForces] = paramSpace_4_3_4_3_2_2_3(sailStates,airStates)

	CL = (3.770087)*sailStates.alpha + (-0.083725)*sailStates.beta + (-2.729680)*sailStates.p + (37.492229)*sailStates.q + (1.100478)*sailStates.r + (0.010628)*sailStates.de;
	CD = 0.098850;
	CY = (0.005768)*sailStates.alpha + (-0.024749)*sailStates.beta + (0.274428)*sailStates.p + (-0.194783)*sailStates.q + (-0.054608)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.266686)*sailStates.alpha + (-0.154096)*sailStates.beta + (-1.352535)*sailStates.p + (11.693344)*sailStates.q + (0.792296)*sailStates.r + (0.000622)*sailStates.de;
	Cm = (-13.263218)*sailStates.alpha + (0.329989)*sailStates.beta + (8.965723)*sailStates.p + (-141.871536)*sailStates.q + (-3.726448)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (-0.218338)*sailStates.alpha + (0.026900)*sailStates.beta + (-0.368150)*sailStates.p + (0.788062)*sailStates.q + (-0.031097)*sailStates.r + (0.000070)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end