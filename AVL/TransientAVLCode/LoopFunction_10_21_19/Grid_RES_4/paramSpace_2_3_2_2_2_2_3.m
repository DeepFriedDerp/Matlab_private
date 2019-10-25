function [aeroForces] = paramSpace_2_3_2_2_2_2_3(sailStates,airStates)

	CL = (3.973936)*sailStates.alpha + (0.029342)*sailStates.beta + (-2.968721)*sailStates.p + (38.235989)*sailStates.q + (-0.391004)*sailStates.r + (0.011227)*sailStates.de;
	CD = 0.033870;
	CY = (-0.003973)*sailStates.alpha + (-0.024937)*sailStates.beta + (-0.099468)*sailStates.p + (0.100924)*sailStates.q + (-0.006523)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.355838)*sailStates.alpha + (0.054595)*sailStates.beta + (-1.520205)*sailStates.p + (12.633905)*sailStates.q + (-0.282892)*sailStates.r + (0.000834)*sailStates.de;
	Cm = (-14.376616)*sailStates.alpha + (-0.115779)*sailStates.beta + (10.097520)*sailStates.p + (-148.239990)*sailStates.q + (1.334424)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (0.097683)*sailStates.alpha + (0.003132)*sailStates.beta + (0.125928)*sailStates.p + (-0.278107)*sailStates.q + (-0.003782)*sailStates.r + (-0.000035)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end