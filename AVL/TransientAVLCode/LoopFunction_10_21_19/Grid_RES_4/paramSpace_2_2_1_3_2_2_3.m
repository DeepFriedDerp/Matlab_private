function [aeroForces] = paramSpace_2_2_1_3_2_2_3(sailStates,airStates)

	CL = (3.995384)*sailStates.alpha + (-0.035702)*sailStates.beta + (-2.826492)*sailStates.p + (37.102394)*sailStates.q + (-0.381375)*sailStates.r + (0.011123)*sailStates.de;
	CD = 0.044710;
	CY = (-0.003574)*sailStates.alpha + (-0.025006)*sailStates.beta + (-0.108731)*sailStates.p + (0.065300)*sailStates.q + (-0.007134)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.369901)*sailStates.alpha + (0.042801)*sailStates.beta + (-1.436751)*sailStates.p + (11.962361)*sailStates.q + (-0.293961)*sailStates.r + (0.000733)*sailStates.de;
	Cm = (-14.457582)*sailStates.alpha + (0.158941)*sailStates.beta + (9.620146)*sailStates.p + (-144.341232)*sailStates.q + (1.324503)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (0.088997)*sailStates.alpha + (0.003220)*sailStates.beta + (0.141785)*sailStates.p + (-0.253677)*sailStates.q + (-0.004070)*sailStates.r + (-0.000012)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end