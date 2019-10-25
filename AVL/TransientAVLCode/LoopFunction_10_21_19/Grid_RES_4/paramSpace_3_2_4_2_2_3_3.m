function [aeroForces] = paramSpace_3_2_4_2_2_3_3(sailStates,airStates)

	CL = (4.509450)*sailStates.alpha + (0.115276)*sailStates.beta + (-2.994768)*sailStates.p + (39.460339)*sailStates.q + (1.409533)*sailStates.r + (0.011440)*sailStates.de;
	CD = -0.484510;
	CY = (0.085791)*sailStates.alpha + (-0.025023)*sailStates.beta + (0.591394)*sailStates.p + (-0.100922)*sailStates.q + (-0.038773)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.549006)*sailStates.alpha + (-0.259778)*sailStates.beta + (-1.561047)*sailStates.p + (13.357383)*sailStates.q + (1.253542)*sailStates.r + (0.000922)*sailStates.de;
	Cm = (-13.881962)*sailStates.alpha + (-0.470520)*sailStates.beta + (9.869748)*sailStates.p + (-148.239975)*sailStates.q + (-4.809559)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (-0.285996)*sailStates.alpha + (0.019480)*sailStates.beta + (-1.216800)*sailStates.p + (5.127797)*sailStates.q + (0.003990)*sailStates.r + (0.000120)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end