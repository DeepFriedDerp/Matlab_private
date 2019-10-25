function [aeroForces] = paramSpace_1_4_2_2_1_1_3(sailStates,airStates)

	CL = (4.092394)*sailStates.alpha + (0.446653)*sailStates.beta + (-2.947803)*sailStates.p + (41.818275)*sailStates.q + (-1.968548)*sailStates.r + (0.011344)*sailStates.de;
	CD = -0.365520;
	CY = (-0.169259)*sailStates.alpha + (-0.026282)*sailStates.beta + (-0.623582)*sailStates.p + (-0.455226)*sailStates.q + (-0.124022)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.205770)*sailStates.alpha + (0.457690)*sailStates.beta + (-1.463192)*sailStates.p + (13.213042)*sailStates.q + (-1.591812)*sailStates.r + (0.000763)*sailStates.de;
	Cm = (-11.543070)*sailStates.alpha + (-1.692232)*sailStates.beta + (8.945473)*sailStates.p + (-145.756409)*sailStates.q + (6.570287)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (0.475242)*sailStates.alpha + (0.067233)*sailStates.beta + (1.175843)*sailStates.p + (-3.938883)*sailStates.q + (-0.024916)*sailStates.r + (0.000023)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end