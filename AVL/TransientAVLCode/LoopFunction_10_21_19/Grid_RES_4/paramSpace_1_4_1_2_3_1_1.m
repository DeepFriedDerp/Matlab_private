function [aeroForces] = paramSpace_1_4_1_2_3_1_1(sailStates,airStates)

	CL = (4.660326)*sailStates.alpha + (0.477789)*sailStates.beta + (-2.127831)*sailStates.p + (35.509636)*sailStates.q + (-2.051082)*sailStates.r + (0.010864)*sailStates.de;
	CD = -0.624260;
	CY = (0.198153)*sailStates.alpha + (-0.023196)*sailStates.beta + (-0.782371)*sailStates.p + (0.455226)*sailStates.q + (-0.155672)*sailStates.r + (0.000095)*sailStates.de;

	Cl = (1.334979)*sailStates.alpha + (0.495877)*sailStates.beta + (-0.799105)*sailStates.p + (7.168520)*sailStates.q + (-1.676898)*sailStates.r + (-0.000354)*sailStates.de;
	Cm = (-11.801335)*sailStates.alpha + (-1.854963)*sailStates.beta + (5.917201)*sailStates.p + (-121.885399)*sailStates.q + (6.824265)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (-0.765200)*sailStates.alpha + (0.067376)*sailStates.beta + (1.631089)*sailStates.p + (-7.233948)*sailStates.q + (0.022270)*sailStates.r + (-0.000231)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end