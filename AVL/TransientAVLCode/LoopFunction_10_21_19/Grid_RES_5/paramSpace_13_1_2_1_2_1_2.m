function [aeroForces] = paramSpace_13_1_2_1_2_1_2(sailStates,airStates)

	CL = (4.621655)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.936839)*sailStates.p + (35.184544)*sailStates.q + (-0.490320)*sailStates.r + (0.010233)*sailStates.de;
	CD = -0.756670;
	CY = (-0.039338)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.506264)*sailStates.p + (0.624084)*sailStates.q + (0.089246)*sailStates.r + (0.000134)*sailStates.de;

	Cl = (1.678544)*sailStates.alpha + (0.228236)*sailStates.beta + (-1.569597)*sailStates.p + (12.649256)*sailStates.q + (-0.669710)*sailStates.r + (0.001057)*sailStates.de;
	Cm = (-15.448122)*sailStates.alpha + (0.000000)*sailStates.beta + (10.985593)*sailStates.p + (-150.579605)*sailStates.q + (1.569203)*sailStates.r + (-0.069965)*sailStates.de;
	Cn = (-0.054937)*sailStates.alpha + (-0.040244)*sailStates.beta + (1.374193)*sailStates.p + (-7.590572)*sailStates.q + (-0.075440)*sailStates.r + (-0.000290)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end