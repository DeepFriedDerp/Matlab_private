function [aeroForces] = paramSpace_4_3_2_2_2_2_1(sailStates,airStates)

	CL = (3.844529)*sailStates.alpha + (-0.058181)*sailStates.beta + (-2.093017)*sailStates.p + (31.955315)*sailStates.q + (0.826548)*sailStates.r + (0.010495)*sailStates.de;
	CD = 0.055430;
	CY = (0.009197)*sailStates.alpha + (-0.025286)*sailStates.beta + (0.166663)*sailStates.p + (0.301044)*sailStates.q + (-0.033162)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (0.952829)*sailStates.alpha + (-0.111356)*sailStates.beta + (-0.829441)*sailStates.p + (6.644417)*sailStates.q + (0.535022)*sailStates.r + (-0.000219)*sailStates.de;
	Cm = (-13.639501)*sailStates.alpha + (0.201531)*sailStates.beta + (6.924806)*sailStates.p + (-123.990753)*sailStates.q + (-2.773291)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (0.019916)*sailStates.alpha + (0.019728)*sailStates.beta + (-0.264211)*sailStates.p + (0.635847)*sailStates.q + (-0.021068)*sailStates.r + (-0.000065)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end