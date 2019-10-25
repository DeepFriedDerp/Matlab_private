function [aeroForces] = paramSpace_1_2_2_3_3_3_3(sailStates,airStates)

	CL = (3.960506)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.698042)*sailStates.p + (35.371403)*sailStates.q + (-0.437784)*sailStates.r + (0.010460)*sailStates.de;
	CD = -0.043990;
	CY = (0.081836)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.000126)*sailStates.p + (0.665001)*sailStates.q + (-0.000022)*sailStates.r + (0.000142)*sailStates.de;

	Cl = (1.303789)*sailStates.alpha + (-0.026464)*sailStates.beta + (-1.359858)*sailStates.p + (11.343093)*sailStates.q + (-0.169152)*sailStates.r + (0.000642)*sailStates.de;
	Cm = (-14.516742)*sailStates.alpha + (0.000000)*sailStates.beta + (9.374805)*sailStates.p + (-141.960541)*sailStates.q + (1.493324)*sailStates.r + (-0.069034)*sailStates.de;
	Cn = (0.122191)*sailStates.alpha + (-0.004666)*sailStates.beta + (-0.231019)*sailStates.p + (1.334586)*sailStates.q + (-0.028281)*sailStates.r + (-0.000170)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end