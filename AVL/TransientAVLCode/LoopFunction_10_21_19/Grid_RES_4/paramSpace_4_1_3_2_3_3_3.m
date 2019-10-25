function [aeroForces] = paramSpace_4_1_3_2_3_3_3(sailStates,airStates)

	CL = (4.092394)*sailStates.alpha + (0.446653)*sailStates.beta + (-2.947803)*sailStates.p + (41.818275)*sailStates.q + (1.968549)*sailStates.r + (0.011344)*sailStates.de;
	CD = -0.365520;
	CY = (0.169259)*sailStates.alpha + (-0.023290)*sailStates.beta + (0.623582)*sailStates.p + (0.455226)*sailStates.q + (-0.124022)*sailStates.r + (0.000096)*sailStates.de;

	Cl = (1.315557)*sailStates.alpha + (-0.192510)*sailStates.beta + (-1.557564)*sailStates.p + (14.400922)*sailStates.q + (1.610627)*sailStates.r + (0.001019)*sailStates.de;
	Cm = (-11.543069)*sailStates.alpha + (-1.692232)*sailStates.beta + (8.945474)*sailStates.p + (-145.756378)*sailStates.q + (-6.570288)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (-0.586602)*sailStates.alpha + (0.062100)*sailStates.beta + (-1.157071)*sailStates.p + (3.702598)*sailStates.q + (-0.028659)*sailStates.r + (-0.000023)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end