function [aeroForces] = paramSpace_1_1_2_2_2_1_2(sailStates,airStates)

	CL = (7.154502)*sailStates.alpha + (0.441597)*sailStates.beta + (-2.559302)*sailStates.p + (29.923765)*sailStates.q + (0.220964)*sailStates.r + (0.008801)*sailStates.de;
	CD = -4.055120;
	CY = (1.751259)*sailStates.alpha + (-0.052269)*sailStates.beta + (-0.258577)*sailStates.p + (14.318626)*sailStates.q + (-0.033028)*sailStates.r + (0.003049)*sailStates.de;

	Cl = (-1.094795)*sailStates.alpha + (-0.431987)*sailStates.beta + (-1.441873)*sailStates.p + (12.266451)*sailStates.q + (0.810261)*sailStates.r + (0.000575)*sailStates.de;
	Cm = (-13.373993)*sailStates.alpha + (-2.079160)*sailStates.beta + (9.177457)*sailStates.p + (-137.630585)*sailStates.q + (-0.936565)*sailStates.r + (-0.068355)*sailStates.de;
	Cn = (-1.859570)*sailStates.alpha + (-0.037620)*sailStates.beta + (-0.024582)*sailStates.p + (-9.909998)*sailStates.q + (0.126657)*sailStates.r + (-0.004041)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end