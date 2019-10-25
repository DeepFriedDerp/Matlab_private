function [aeroForces] = paramSpace_1_3_3_3_1_1_1(sailStates,airStates)

	CL = (4.068384)*sailStates.alpha + (0.106133)*sailStates.beta + (-2.294167)*sailStates.p + (35.369610)*sailStates.q + (-1.417400)*sailStates.r + (0.011021)*sailStates.de;
	CD = -0.130970;
	CY = (-0.044312)*sailStates.alpha + (-0.025680)*sailStates.beta + (-0.408774)*sailStates.p + (-0.684401)*sailStates.q + (-0.081335)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.045147)*sailStates.alpha + (0.260889)*sailStates.beta + (-0.966487)*sailStates.p + (8.314973)*sailStates.q + (-1.090412)*sailStates.r + (-0.000008)*sailStates.de;
	Cm = (-12.742957)*sailStates.alpha + (-0.386812)*sailStates.beta + (7.101849)*sailStates.p + (-128.521423)*sailStates.q + (4.724545)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (-0.112518)*sailStates.alpha + (0.046598)*sailStates.beta + (0.802475)*sailStates.p + (-2.641359)*sailStates.q + (-0.019022)*sailStates.r + (0.000127)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end