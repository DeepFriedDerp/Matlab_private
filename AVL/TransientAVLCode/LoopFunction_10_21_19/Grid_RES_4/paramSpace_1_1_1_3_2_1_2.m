function [aeroForces] = paramSpace_1_1_1_3_2_1_2(sailStates,airStates)

	CL = (4.074191)*sailStates.alpha + (-0.388510)*sailStates.beta + (-2.510134)*sailStates.p + (37.415207)*sailStates.q + (-1.652852)*sailStates.r + (0.010802)*sailStates.de;
	CD = -0.173510;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.544581)*sailStates.p + (-0.000000)*sailStates.q + (-0.108324)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.344596)*sailStates.alpha + (0.160552)*sailStates.beta + (-1.216689)*sailStates.p + (11.043642)*sailStates.q + (-1.329857)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-12.297578)*sailStates.alpha + (1.519356)*sailStates.beta + (7.662428)*sailStates.p + (-133.820877)*sailStates.q + (5.535508)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.068622)*sailStates.alpha + (0.053103)*sailStates.beta + (1.018766)*sailStates.p + (-3.665882)*sailStates.q + (-0.014039)*sailStates.r + (-0.000068)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end