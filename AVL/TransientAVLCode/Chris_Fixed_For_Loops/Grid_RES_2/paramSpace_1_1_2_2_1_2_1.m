function [aeroForces] = paramSpace_1_1_2_2_1_2_1(sailStates,airStates)

	CL = (5.328452)*sailStates.alpha + (0.652437)*sailStates.beta + (-5.486200)*sailStates.p + (51.852867)*sailStates.q + (2.123832)*sailStates.r + (0.010759)*sailStates.de;
	CD = -6.088430;
	CY = (2.037705)*sailStates.alpha + (-0.031261)*sailStates.beta + (1.226406)*sailStates.p + (3.373208)*sailStates.q + (0.161698)*sailStates.r + (0.000759)*sailStates.de;

	Cl = (-0.203127)*sailStates.alpha + (-0.625259)*sailStates.beta + (-3.773630)*sailStates.p + (32.619148)*sailStates.q + (2.299855)*sailStates.r + (0.004852)*sailStates.de;
	Cm = (0.504166)*sailStates.alpha + (-2.721351)*sailStates.beta + (20.481750)*sailStates.p + (-222.588242)*sailStates.q + (-7.167528)*sailStates.r + (-0.079619)*sailStates.de;
	Cn = (-7.502131)*sailStates.alpha + (-0.109025)*sailStates.beta + (-3.342460)*sailStates.p + (14.672078)*sailStates.q + (-0.072477)*sailStates.r + (-0.000573)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end