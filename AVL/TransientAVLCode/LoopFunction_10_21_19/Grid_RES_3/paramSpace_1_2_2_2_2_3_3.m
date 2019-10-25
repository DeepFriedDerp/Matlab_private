function [aeroForces] = paramSpace_1_2_2_2_2_3_3(sailStates,airStates)

	CL = (4.149351)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.824594)*sailStates.p + (35.328308)*sailStates.q + (-0.000109)*sailStates.r + (0.010306)*sailStates.de;
	CD = -0.309020;
	CY = (0.071152)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.229538)*sailStates.p + (0.267957)*sailStates.q + (0.040474)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.396661)*sailStates.alpha + (-0.125458)*sailStates.beta + (-1.473338)*sailStates.p + (12.101068)*sailStates.q + (0.229199)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-14.814053)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.184209)*sailStates.p + (-146.430145)*sailStates.q + (0.052112)*sailStates.r + (-0.069510)*sailStates.de;
	Cn = (0.111270)*sailStates.alpha + (-0.022122)*sailStates.beta + (-0.761267)*sailStates.p + (4.121475)*sailStates.q + (-0.048010)*sailStates.r + (-0.000011)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end