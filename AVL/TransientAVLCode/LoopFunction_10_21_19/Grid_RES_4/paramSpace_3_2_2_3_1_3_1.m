function [aeroForces] = paramSpace_3_2_2_3_1_3_1(sailStates,airStates)

	CL = (4.387145)*sailStates.alpha + (0.074976)*sailStates.beta + (-2.318549)*sailStates.p + (33.660732)*sailStates.q + (1.077820)*sailStates.r + (0.011089)*sailStates.de;
	CD = -0.242200;
	CY = (-0.103565)*sailStates.alpha + (-0.025115)*sailStates.beta + (0.446472)*sailStates.p + (-0.432842)*sailStates.q + (-0.029248)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.304129)*sailStates.alpha + (-0.182342)*sailStates.beta + (-1.014101)*sailStates.p + (8.230338)*sailStates.q + (0.906799)*sailStates.r + (0.000035)*sailStates.de;
	Cm = (-14.482476)*sailStates.alpha + (-0.276352)*sailStates.beta + (7.687303)*sailStates.p + (-129.813766)*sailStates.q + (-3.638134)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (0.343245)*sailStates.alpha + (0.013908)*sailStates.beta + (-0.939707)*sailStates.p + (4.459812)*sailStates.q + (0.006469)*sailStates.r + (0.000203)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end