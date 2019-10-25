function [aeroForces] = paramSpace_3_4_3_3_3_2_2(sailStates,airStates)

	CL = (3.982693)*sailStates.alpha + (-0.061809)*sailStates.beta + (-2.552017)*sailStates.p + (34.683594)*sailStates.q + (0.205216)*sailStates.r + (0.010859)*sailStates.de;
	CD = 0.032250;
	CY = (0.061572)*sailStates.alpha + (-0.025370)*sailStates.beta + (0.001932)*sailStates.p + (0.498142)*sailStates.q + (-0.000109)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.156011)*sailStates.alpha + (-0.033442)*sailStates.beta + (-1.153058)*sailStates.p + (9.099514)*sailStates.q + (0.129335)*sailStates.r + (0.000220)*sailStates.de;
	Cm = (-14.456405)*sailStates.alpha + (0.257363)*sailStates.beta + (8.745522)*sailStates.p + (-136.384674)*sailStates.q + (-0.712541)*sailStates.r + (-0.069025)*sailStates.de;
	Cn = (-0.116331)*sailStates.alpha + (0.002486)*sailStates.beta + (0.050189)*sailStates.p + (-0.842720)*sailStates.q + (-0.006868)*sailStates.r + (-0.000151)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end