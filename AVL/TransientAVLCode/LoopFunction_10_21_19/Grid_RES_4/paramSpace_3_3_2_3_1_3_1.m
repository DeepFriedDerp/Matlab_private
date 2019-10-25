function [aeroForces] = paramSpace_3_3_2_3_1_3_1(sailStates,airStates)

	CL = (4.387145)*sailStates.alpha + (-0.074976)*sailStates.beta + (-2.318549)*sailStates.p + (33.660736)*sailStates.q + (1.077820)*sailStates.r + (0.011089)*sailStates.de;
	CD = -0.242200;
	CY = (-0.103565)*sailStates.alpha + (-0.024837)*sailStates.beta + (0.446472)*sailStates.p + (-0.432842)*sailStates.q + (-0.029248)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.251335)*sailStates.alpha + (-0.228618)*sailStates.beta + (-0.981451)*sailStates.p + (7.826463)*sailStates.q + (0.904673)*sailStates.r + (-0.000052)*sailStates.de;
	Cm = (-14.482476)*sailStates.alpha + (0.276352)*sailStates.beta + (7.687303)*sailStates.p + (-129.813766)*sailStates.q + (-3.638134)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (0.364731)*sailStates.alpha + (0.013028)*sailStates.beta + (-0.941847)*sailStates.p + (4.486283)*sailStates.q + (0.006608)*sailStates.r + (0.000203)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end