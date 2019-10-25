function [aeroForces] = paramSpace_2_2_2_2_2_2_3(sailStates,airStates)

	CL = (3.973936)*sailStates.alpha + (-0.029342)*sailStates.beta + (-2.968720)*sailStates.p + (38.235992)*sailStates.q + (-0.391004)*sailStates.r + (0.011227)*sailStates.de;
	CD = 0.033870;
	CY = (-0.003973)*sailStates.alpha + (-0.025016)*sailStates.beta + (-0.099468)*sailStates.p + (0.100924)*sailStates.q + (-0.006523)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.400446)*sailStates.alpha + (0.036470)*sailStates.beta + (-1.552852)*sailStates.p + (13.037782)*sailStates.q + (-0.285046)*sailStates.r + (0.000922)*sailStates.de;
	Cm = (-14.376617)*sailStates.alpha + (0.115779)*sailStates.beta + (10.097520)*sailStates.p + (-148.239975)*sailStates.q + (1.334424)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (0.104607)*sailStates.alpha + (0.002837)*sailStates.beta + (0.123788)*sailStates.p + (-0.251635)*sailStates.q + (-0.003923)*sailStates.r + (-0.000035)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end