function [aeroForces] = paramSpace_4_2_2_3_3_3_1(sailStates,airStates)

	CL = (4.068384)*sailStates.alpha + (0.106133)*sailStates.beta + (-2.294167)*sailStates.p + (35.369610)*sailStates.q + (1.417400)*sailStates.r + (0.011021)*sailStates.de;
	CD = -0.130970;
	CY = (0.044312)*sailStates.alpha + (-0.024272)*sailStates.beta + (0.408774)*sailStates.p + (0.684401)*sailStates.q + (-0.081335)*sailStates.r + (0.000144)*sailStates.de;

	Cl = (1.092861)*sailStates.alpha + (-0.201419)*sailStates.beta + (-0.998030)*sailStates.p + (8.711943)*sailStates.q + (1.096672)*sailStates.r + (0.000078)*sailStates.de;
	Cm = (-12.742957)*sailStates.alpha + (-0.386812)*sailStates.beta + (7.101849)*sailStates.p + (-128.521423)*sailStates.q + (-4.724545)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (0.082025)*sailStates.alpha + (0.045361)*sailStates.beta + (-0.796200)*sailStates.p + (2.562397)*sailStates.q + (-0.020268)*sailStates.r + (-0.000127)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end