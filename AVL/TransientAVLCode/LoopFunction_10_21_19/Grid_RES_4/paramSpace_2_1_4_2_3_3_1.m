function [aeroForces] = paramSpace_2_1_4_2_3_3_1(sailStates,airStates)

	CL = (4.229731)*sailStates.alpha + (0.177394)*sailStates.beta + (-2.111155)*sailStates.p + (30.254562)*sailStates.q + (0.541987)*sailStates.r + (0.010491)*sailStates.de;
	CD = -0.336580;
	CY = (0.028512)*sailStates.alpha + (-0.025288)*sailStates.beta + (0.315844)*sailStates.p + (0.668511)*sailStates.q + (0.020772)*sailStates.r + (0.000142)*sailStates.de;

	Cl = (1.062224)*sailStates.alpha + (-0.147287)*sailStates.beta + (-0.906153)*sailStates.p + (6.960987)*sailStates.q + (0.628164)*sailStates.r + (-0.000072)*sailStates.de;
	Cm = (-14.636252)*sailStates.alpha + (-0.804524)*sailStates.beta + (7.487702)*sailStates.p + (-124.743294)*sailStates.q + (-1.873783)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (0.312706)*sailStates.alpha + (-0.013042)*sailStates.beta + (-0.762030)*sailStates.p + (2.990402)*sailStates.q + (-0.005303)*sailStates.r + (-0.000142)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end