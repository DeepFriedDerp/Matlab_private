function [aeroForces] = paramSpace_2_1_1_2_2_1_2(sailStates,airStates)

	CL = (5.978256)*sailStates.alpha + (-1.921286)*sailStates.beta + (-3.697957)*sailStates.p + (50.732910)*sailStates.q + (2.249484)*sailStates.r + (0.012849)*sailStates.de;
	CD = -5.895360;
	CY = (1.958840)*sailStates.alpha + (-0.120744)*sailStates.beta + (0.298862)*sailStates.p + (15.324964)*sailStates.q + (-0.033919)*sailStates.r + (0.003245)*sailStates.de;

	Cl = (-4.934935)*sailStates.alpha + (-1.040087)*sailStates.beta + (-1.876997)*sailStates.p + (16.264935)*sailStates.q + (2.440475)*sailStates.r + (0.001622)*sailStates.de;
	Cm = (2.825787)*sailStates.alpha + (8.445956)*sailStates.beta + (11.573696)*sailStates.p + (-164.815567)*sailStates.q + (-7.893933)*sailStates.r + (-0.068273)*sailStates.de;
	Cn = (-2.226055)*sailStates.alpha + (0.203185)*sailStates.beta + (-0.877958)*sailStates.p + (-8.660031)*sailStates.q + (-0.185191)*sailStates.r + (-0.004205)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end