function [aeroForces] = paramSpace_3_3_3_1_2_3_3(sailStates,airStates)

	CL = (6.157808)*sailStates.alpha + (-0.205463)*sailStates.beta + (-3.509172)*sailStates.p + (44.804428)*sailStates.q + (2.676811)*sailStates.r + (0.012029)*sailStates.de;
	CD = -2.369440;
	CY = (0.400007)*sailStates.alpha + (-0.024889)*sailStates.beta + (1.169093)*sailStates.p + (-0.221996)*sailStates.q + (-0.076634)*sailStates.r + (-0.000049)*sailStates.de;

	Cl = (2.024039)*sailStates.alpha + (-0.634563)*sailStates.beta + (-1.932688)*sailStates.p + (16.993523)*sailStates.q + (2.413846)*sailStates.r + (0.001486)*sailStates.de;
	Cm = (-12.612410)*sailStates.alpha + (0.805117)*sailStates.beta + (11.214433)*sailStates.p + (-161.490479)*sailStates.q + (-9.080731)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (-1.423238)*sailStates.alpha + (0.036681)*sailStates.beta + (-2.497991)*sailStates.p + (11.022053)*sailStates.q + (0.013766)*sailStates.r + (0.000308)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end