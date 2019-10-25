function [aeroForces] = paramSpace_3_4_1_2_2_1_3(sailStates,airStates)

	CL = (4.364946)*sailStates.alpha + (0.191343)*sailStates.beta + (-2.923419)*sailStates.p + (36.728973)*sailStates.q + (-0.639324)*sailStates.r + (0.010876)*sailStates.de;
	CD = -0.426220;
	CY = (-0.080335)*sailStates.alpha + (-0.024710)*sailStates.beta + (-0.407941)*sailStates.p + (-0.100924)*sailStates.q + (0.026749)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.392681)*sailStates.alpha + (0.247995)*sailStates.beta + (-1.470422)*sailStates.p + (11.836738)*sailStates.q + (-0.713480)*sailStates.r + (0.000739)*sailStates.de;
	Cm = (-14.712687)*sailStates.alpha + (-0.853829)*sailStates.beta + (10.262191)*sailStates.p + (-147.195892)*sailStates.q + (2.203317)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (0.041389)*sailStates.alpha + (-0.011670)*sailStates.beta + (0.987711)*sailStates.p + (-4.584808)*sailStates.q + (-0.012002)*sailStates.r + (-0.000038)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end