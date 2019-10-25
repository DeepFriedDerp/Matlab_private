function [aeroForces] = paramSpace_1_2_2_1_1_1_2(sailStates,airStates)

	CL = (4.400318)*sailStates.alpha + (0.266725)*sailStates.beta + (-3.116147)*sailStates.p + (42.063271)*sailStates.q + (-1.821599)*sailStates.r + (0.011762)*sailStates.de;
	CD = -0.602530;
	CY = (-0.228164)*sailStates.alpha + (-0.025821)*sailStates.beta + (-0.621415)*sailStates.p + (-0.715007)*sailStates.q + (-0.081861)*sailStates.r + (-0.000154)*sailStates.de;

	Cl = (1.282190)*sailStates.alpha + (0.418785)*sailStates.beta + (-1.600515)*sailStates.p + (14.050830)*sailStates.q + (-1.529511)*sailStates.r + (0.000964)*sailStates.de;
	Cm = (-12.438828)*sailStates.alpha + (-0.982806)*sailStates.beta + (9.832413)*sailStates.p + (-150.764206)*sailStates.q + (6.110578)*sailStates.r + (-0.070345)*sailStates.de;
	Cn = (0.568907)*sailStates.alpha + (0.044711)*sailStates.beta + (1.250609)*sailStates.p + (-4.516232)*sailStates.q + (-0.008997)*sailStates.r + (0.000065)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end