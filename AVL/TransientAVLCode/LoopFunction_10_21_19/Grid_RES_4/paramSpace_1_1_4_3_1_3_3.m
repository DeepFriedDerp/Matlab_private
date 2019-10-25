function [aeroForces] = paramSpace_1_1_4_3_1_3_3(sailStates,airStates)

	CL = (3.955159)*sailStates.alpha + (-0.016132)*sailStates.beta + (-2.677668)*sailStates.p + (34.667816)*sailStates.q + (-0.279778)*sailStates.r + (0.010273)*sailStates.de;
	CD = -0.120210;
	CY = (-0.018042)*sailStates.alpha + (-0.023940)*sailStates.beta + (0.151558)*sailStates.p + (-0.294836)*sailStates.q + (0.030115)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.380690)*sailStates.alpha + (-0.085258)*sailStates.beta + (-1.400980)*sailStates.p + (11.763275)*sailStates.q + (-0.012521)*sailStates.r + (0.000819)*sailStates.de;
	Cm = (-14.603835)*sailStates.alpha + (-0.060896)*sailStates.beta + (9.534227)*sailStates.p + (-141.543869)*sailStates.q + (0.968633)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (0.245218)*sailStates.alpha + (-0.021213)*sailStates.beta + (-0.565883)*sailStates.p + (3.613713)*sailStates.q + (-0.059898)*sailStates.r + (0.000108)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end