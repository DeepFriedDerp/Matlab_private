function [aeroForces] = paramSpace_3_1_1_2_1_1_3(sailStates,airStates)

	CL = (4.224648)*sailStates.alpha + (-0.163473)*sailStates.beta + (-2.915673)*sailStates.p + (36.771469)*sailStates.q + (-0.438316)*sailStates.r + (0.010874)*sailStates.de;
	CD = -0.327960;
	CY = (-0.153351)*sailStates.alpha + (-0.025439)*sailStates.beta + (-0.283533)*sailStates.p + (-0.870358)*sailStates.q + (0.018676)*sailStates.r + (-0.000188)*sailStates.de;

	Cl = (1.409357)*sailStates.alpha + (0.147734)*sailStates.beta + (-1.563307)*sailStates.p + (13.058738)*sailStates.q + (-0.543015)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-14.506805)*sailStates.alpha + (0.758703)*sailStates.beta + (10.173846)*sailStates.p + (-146.834122)*sailStates.q + (1.532184)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (0.141950)*sailStates.alpha + (-0.012662)*sailStates.beta + (0.738646)*sailStates.p + (-2.936327)*sailStates.q + (-0.006571)*sailStates.r + (0.000203)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end