function [aeroForces] = paramSpace_2_1_3_2_2_1_1(sailStates,airStates)

	CL = (4.474385)*sailStates.alpha + (-0.286475)*sailStates.beta + (-2.171359)*sailStates.p + (32.643738)*sailStates.q + (-1.283291)*sailStates.r + (0.010943)*sailStates.de;
	CD = -0.466750;
	CY = (0.075354)*sailStates.alpha + (-0.024689)*sailStates.beta + (-0.528190)*sailStates.p + (-0.100922)*sailStates.q + (-0.034623)*sailStates.r + (-0.000021)*sailStates.de;

	Cl = (1.235218)*sailStates.alpha + (0.183107)*sailStates.beta + (-0.927520)*sailStates.p + (7.586000)*sailStates.q + (-1.119490)*sailStates.r + (-0.000055)*sailStates.de;
	Cm = (-13.838388)*sailStates.alpha + (1.081743)*sailStates.beta + (7.124624)*sailStates.p + (-125.105080)*sailStates.q + (4.342433)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (-0.466610)*sailStates.alpha + (0.018633)*sailStates.beta + (1.145703)*sailStates.p + (-5.022843)*sailStates.q + (0.005691)*sailStates.r + (-0.000063)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end