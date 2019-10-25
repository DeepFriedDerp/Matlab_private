function [aeroForces] = paramSpace_4_3_2_3_3_1_1(sailStates,airStates)

	CL = (4.008208)*sailStates.alpha + (-0.003610)*sailStates.beta + (-2.194320)*sailStates.p + (30.711077)*sailStates.q + (0.094823)*sailStates.r + (0.010101)*sailStates.de;
	CD = -0.128800;
	CY = (0.103043)*sailStates.alpha + (-0.025680)*sailStates.beta + (-0.197333)*sailStates.p + (0.684401)*sailStates.q + (0.039228)*sailStates.r + (0.000144)*sailStates.de;

	Cl = (1.092372)*sailStates.alpha + (0.070681)*sailStates.beta + (-0.934907)*sailStates.p + (7.085023)*sailStates.q + (-0.136182)*sailStates.r + (-0.000008)*sailStates.de;
	Cm = (-14.856319)*sailStates.alpha + (-0.005299)*sailStates.beta + (7.966678)*sailStates.p + (-128.521423)*sailStates.q + (-0.376756)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (-0.400166)*sailStates.alpha + (-0.011662)*sailStates.beta + (0.576600)*sailStates.p + (-3.542016)*sailStates.q + (-0.050622)*sailStates.r + (-0.000236)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end